import os, json
# from send2trash import send2trash
from logger import Logger
import time

class Config:
    def __init__(self):
        global config_directory, config_files, config_contents, logger

        config_directory = ''
        config_files = {}
        config_contents = {}

        logger = Logger(log_level='I')

        return

    def set_config_directory(self, path):
        """

        :param path: relative or absolute path of config directory
        :return: None (Success) or -1 (Fail)
        """
        global config_directory

        path = os.path.realpath(path)
        if not os.path.exists(path):  # 如果目标不存在则创建目录
            logger.printl('W', 'Target directory does not exist, will create it')
            os.makedirs(path)  # makedirs() 可以递归创建目录
        else:
            if not os.path.isdir(path):  # 如果目标存在但目标不是目录而是文件
                logger.printl('E', 'Target \"{}\" is already exist and it\'s a file instead of a directory'.format(path))
                return -1
                # try:
                #     send2trash(path)  # 将与目录同名的文件放入回收站，跨平台
                # except Exception as e:
                #     print(e.args)
                # self.set_config_directory(path)  # 删完之后自我调用，再创建目录

        config_directory = path  # set_config_directory
        logger.printl('I', 'Now config directory is \"{}\"'.format(config_directory))
        return

    def add_config_file(self, filename_dot_json):
        """

        :param filename_dot_json: e.g. "config.json". It will be the file name and the ID of this config file
        :return: None (Success) or -1 (Fail)
        """
        global config_directory, config_files

        _full_path = os.path.join(config_directory, filename_dot_json)

        if config_directory == '':
            logger.printl('E', 'You must call set_config_directory() before call this function')
            return -1

        if not os.path.exists(_full_path):  # 如果目标不存在则创建文件
            logger.printl('W', 'Target file does not exist, will create it')
            with open(_full_path, 'wt') as f:
                f.write('')
        else:
            if os.path.isdir(_full_path):  # 如果目标存在但目标不是文件而是目录
                logger.printl('E', 'Target \"{}\" is already exist and it\'s a directory instead of a file'.format(
                    _full_path))
                return -1

        config_files[filename_dot_json] = _full_path
        logger.printl('I', 'Config file \"{}\" in \"{}\" is added'.format(filename_dot_json, config_directory))
        return

    def _load_from_disk(self, _full_path, update_config_contents):
        global config_contents

        filename_dot_json = os.path.split(_full_path)[1]
        with open(_full_path) as f:
            _json = f.read()
            try:
                __dict = json.loads(_json)
            except Exception as e:
                logger.printl('E', "Error in json.loads(). Maybe \"{}\" (\"{}\") is empty?\n{}"
                              .format(filename_dot_json, _full_path, e.args))
                return ""
            if update_config_contents:
                config_contents[filename_dot_json] = __dict
            return __dict
    def check_if_modified(self, filename_dot_json):
        """

        :param filename_dot_json:
        :return: 0 for not modified, 1 for modified, or -1 for Fail
        """
        global config_directory, config_files, config_contents

        if config_directory == '':
            logger.printl('E', 'You must call set_config_directory() before call this function')
            return -1

        if filename_dot_json not in config_files:
            logger.printl('E', 'You must call add_config_file() to add \"{}\" before call this function'
                          .format(filename_dot_json))
            return -1

        _full_path = config_files[filename_dot_json]

        if filename_dot_json in config_contents:
            logger.printl('I', '\"{}\" is already in Memory, will check if it has been modified'
                          .format(filename_dot_json))
            _dict = self._load_from_disk(_full_path, update_config_contents=False)
            # print(config_contents[filename_dot_json], _dict)
            if config_contents[filename_dot_json] == _dict:
                logger.printl('I', 'Check passed')
                return 0
            else:
                logger.printl('W', '\"{}\" has been modified'.format(filename_dot_json))
                return 1
        else:
            logger.printl('W', '\"{}\" is not in Memory yet, will not check if it has been modified'
                          .format(filename_dot_json))
            return -1

    def read_config(self, filename_dot_json, key, force_load_from_disk=False):
        """

        :param filename_dot_json:
        :param key:
        :param force_load_from_disk: for Hot Update
        :return: content of config (dict) for Success or "" for Fail
        """
        global config_directory, config_files, config_contents

        if config_directory == '':
            logger.printl('E', 'You must call set_config_directory() before call this function')
            return ""

        if filename_dot_json not in config_files:
            logger.printl('E', 'You must call add_config_file() to add \"{}\" before call this function'
                          .format(filename_dot_json))
            return ""

        _full_path = config_files[filename_dot_json]

        if filename_dot_json not in config_contents:
            logger.printl('I', "Load \"{}\" (\"{}\") from Disk (First load)".format(filename_dot_json, _full_path))
            _dict = self._load_from_disk(_full_path, update_config_contents=True)
        else:
            if force_load_from_disk:
                logger.printl('I', "Load \"{}\" (\"{}\") from Disk (Force)".format(filename_dot_json, _full_path))
                _dict = self._load_from_disk(_full_path, update_config_contents=True)
            else:
                logger.printl('I', "Load \"{}\" (\"{}\") from Memory".format(filename_dot_json, _full_path))
                _dict = config_contents[filename_dot_json]

        if key not in _dict:
            logger.printl('E', "Key \"{}\" is not in \"{}\" (\"{}\")".format(key, filename_dot_json, _full_path))
            return ""

        return _dict[key]

    def write_config(self, filename_dot_json, key, value):
        """

        :param filename_dot_json:
        :param key:
        :param value:
        :return: None for Success or -1 for Fail
        """
        self.check_if_modified(filename_dot_json)

        global config_directory, config_files, config_contents

        if config_directory == '':
            logger.printl('E', 'You must call set_config_directory() before call this function')
            return -1

        if filename_dot_json not in config_files:
            logger.printl('E', 'You must call add_config_file() to add \"{}\" before call this function'
                          .format(filename_dot_json))
            return -1

        _full_path = config_files[filename_dot_json]

        if filename_dot_json not in config_contents:
            logger.printl('W', '\"{}\" is not in Memory yet, will load it'.format(filename_dot_json))
            self._load_from_disk(_full_path, update_config_contents=True)

        config_contents[filename_dot_json][key] = value
        logger.printl('I', 'Now Key \"{}\" in \"{}\" (Memory) is {}'.format(key, filename_dot_json, value))

        try:
            _json = json.dumps(config_contents[filename_dot_json])
        except Exception as e:
            logger.printl('E', "Error in json.dumps()\n{}".format(filename_dot_json, _full_path, e.args))
            return -1

        with open(_full_path, 'w') as f:
            f.write(_json)
        logger.printl('I', 'Now Key \"{}\" in \"{}\" (Disk) is {}'.format(key, filename_dot_json, value))

        return


if __name__ == '__main__':
    config = Config()
    config.set_config_directory(
        os.path.realpath(os.path.join(os.path.split(os.path.realpath(__file__))[0], '../', 'outputs/'))
    )
    config.add_config_file('config.json')
    # print(config.read_config('config.json', 'test'))
    # config.write_config('config.json', 'test', 'goodbye world')
    # config.write_config('config.json', 'test1', {'hello': [0, 1, 2]})
    # print()

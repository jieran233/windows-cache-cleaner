import time, math, inspect


class Logger:
    def __init__(self, log_level='E'):
        """
        :param log_level: 'I': info, 'W': warn, 'E': error, '0': none
        """
        global log_levels, config_log_level, log_level_char_num, colors_level

        log_levels = ['I', 'W', 'E', '0']
        config_log_level = log_level
        log_level_char_num = {
            'I': 16,
            'W': 8,
            'E': 4,
            '0': 0
        }
        colors_level = {
            'I': ['\033[92m', '\033[00m'],  # Green
            'W': ['\033[93m', '\033[00m'],  # Yellow
            'E': ['\033[91m', '\033[00m']  # Red
        }

        if log_level not in log_levels:
            self.printl('E', 'Incorrect parameter: log_level')

        return

    def printl(self, this_level, this_text):  # print log
        _time = time.time()

        global log_levels, config_log_level, log_level_char_num, colors_level

        if this_level not in log_levels:
            self.printl('E', 'Incorrect parameter: this_level')

        _lv_g = log_level_char_num[config_log_level]  # global level
        _lv_t = log_level_char_num[this_level]  # the level of this piece of log

        this_text = str(this_text).replace("\n", "{:54}".format("\n"))

        _f_name = inspect.getframeinfo(inspect.currentframe().f_back)[2]  # 获取调用者的函数名
        # math.modf() 分离小数和整数部分，round() 四舍五入保留指定位数，截取字符串 去掉"0."，str.zfill() 补零
        _time_decimal = str(round(math.modf(_time)[0], 2))[2:].zfill(2)
        _day_time = "{}.{}".format(time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()), _time_decimal)
        if _f_name[-1] == '>':
            _class_func = "{}".format(_f_name)
        else:
            _class_func = "{}()".format(_f_name)
        _class_func = "{:24}".format(_class_func)  # 指定字符串长度
        _level_text = "{} {}: {}{}".format(colors_level[this_level][0],
                                          this_level, this_text,
                                          colors_level[this_level][1])
        if _lv_g >= _lv_t:
            print("[{}]  {}  {}".format(_day_time, _class_func, _level_text))


if __name__ == '__main__':
    logger = Logger('I')
    logger.printl('I', 'Hello Logger!')

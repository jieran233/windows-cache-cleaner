from config import Config
from logger import Logger
import os


def main():
    config = Config()
    logger = Logger('I')

    config.set_config_directory(os.path.realpath(os.path.join(os.path.split(os.path.realpath(__file__))[0], 'config/')))
    config.add_config_file('rules.json')

    outputs = []

    rules = config.read_config('rules.json', 'rules')
    for rule in rules:
        if rule['enable']:
            outputs.append("echo \":: Cleaning {}\"\n".format(rule['name']))
            if "target" in rule:
                for target in rule['target']:
                    # (PowerShell) `rm -r -fo`
                    _cmd = "{} {} \"{}\"".format("rm", "-r -fo", target)
                    outputs.append(_cmd + '\n')
            elif "command" in rule:
                for command in rule['command']:
                    outputs.append(command + '\n')
            else:
                logger.printl('E', ":: The rule \"{}\" doesn't have any target or command, check the rules please"
                              .format(rule['name']))
        else:
            logger.printl('W', ":: Ignore {}, because it's been disabled".format(rule['name']))

    with open(os.path.join(os.path.split(os.path.realpath(__file__))[0], 'cache-cleaner.ps1'), 'w') as f:
        f.writelines(outputs)


if __name__ == '__main__':
    main()

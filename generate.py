from config import Config
from logger import Logger
import os


def main():
    config = Config()
    logger = Logger('I')

    config.set_config_directory(os.path.realpath(os.path.join(os.path.split(os.path.realpath(__file__))[0], 'config/')))
    config.add_config_file('rules.json')

    outputs = ['Write-Output ":: Cleaning..."\n']
    du_commands = [[
                    """function Convert-BytesToHumanReadable { param([float]$Bytes) if ($Bytes -ge 1GB) {"{0:N2} GB" -f ($Bytes / 1GB)} elseif ($Bytes -ge 1MB) {"{0:N2} MB" -f ($Bytes / 1MB)} elseif ($Bytes -ge 1KB) {"{0:N2} KB" -f ($Bytes / 1KB)} else {"$Bytes Bytes"} }\n""",
                    '$du_before = (Get-PSDrive -Name C).Used\n'],
                   ['Write-Output " Done."\n',
                    'Write-Output ":: Calculating..."\n',
                    '$du_after = (Get-PSDrive -Name C).Used\n',
                    '$space_freed = $du_before - $du_after\n',
                    'Write-Output ("-> {0} freed up." -f (Convert-BytesToHumanReadable $space_freed))']]

    rules = config.read_config('rules.json', 'rules')
    i = 0
    for rule in rules:
        i = i + 1
        if rule['enable']:
            outputs.append("Write-Output \" ({}/{}) Cleaning {}\"\n".format(i, len(rules), rule['name']))
            if "target" in rule:
                for target in rule['target']:
                    # (PowerShell) `rm -r -fo`
                    _cmd = "{} {} \"{}\"".format("Remove-Item", "-Recurse -Force -ErrorAction SilentlyContinue", target)
                    outputs.append(_cmd + '\n')
            elif "command" in rule:
                for command in rule['command']:
                    outputs.append(command + '\n')
            else:
                logger.printl('E', ":: The rule \"{}\" doesn't have any target or command, check the rules please"
                              .format(rule['name']))
        else:
            logger.printl('W', ":: Ignore {}, because it's been disabled".format(rule['name']))

    outputs = du_commands[0] + outputs + du_commands[1]

    with open(os.path.join(os.path.split(os.path.realpath(__file__))[0], 'cache-cleaner.ps1'), 'w') as f:
        f.writelines(outputs)


if __name__ == '__main__':
    main()

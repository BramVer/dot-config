import pdb


class Config(pdb.DefaultConfig):
    sticky_by_default = True
    prompt = '🐕🤠🐕: '
    highlight = True
    use_pygments = True
    pygments_formatter_class = "pygments.formatters.TerminalTrueColorFormatter"
    pygments_formatter_kwargs = {"style": "solarized-light"}

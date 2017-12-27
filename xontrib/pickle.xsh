import xonsh
import pickle

__all__ = ()
__version__ = '0.0.1'

VAR_HOME = p"$XONSH_DATA_DIR/pickles"

if not VAR_HOME.exists():
    VAR_HOME.mkdir()


def _savevar(argv, stdin=None):
    name, = argv
    val = __xonsh_ctx__[name]
    with (VAR_HOME / name).open('wb') as pf:
        pickle.dump(val, pf)

aliases['save'] = _savevar


def _loadvar(argv, stdin=None):
    name, = argv
    with (VAR_HOME / name).open('rb') as pf:
        val = pickle.load(pf)
    __xonsh_ctx__[name] = val

aliases['load'] = _loadvar


def _lsvars(argv, stdin=None):
    for f in VAR_HOME.iterdir():
        if f.is_file():
            print(f.name)

aliases['lsvars'] = _lsvars


def _delvar(argv, stdin=None):
    name, = argv
    (VAR_HOME / name).unlink()

aliases['delvar'] = _delvar

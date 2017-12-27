from setuptools import setup

setup(
    name='xontrib-pickle',
    version='0.0.1',
    url='https://github.com/astronouth7303/xontrib-pickle',
    license='MIT',
    author='Jamie Bliss',
    author_email='jamie.bliss@astro73.com',
    description='Load/save variables',
    packages=['xontrib'],
    package_dir={'xontrib': 'xontrib'},
    package_data={'xontrib': ['*.xsh']},
    platforms='any',
)

# Build Failed
## Error: PythonPipBuilder:Validation - Binary validation failed for python, searched for python in following locations  : ['/usr/local/bin/python', '/usr/bin/python'] which did not satisfy constraints for runtime: python3.7. Do you have python for runtime: python3.7 on your PATH?

## How to export PATH to "sam build" command?
https://stackoverflow.com/questions/65180787/how-to-export-path-to-sam-build-command

```sh
brew info python@3.8
ln -sf /usr/local/opt/python@3.8/bin/python3.8 /usr/local/bin/

```
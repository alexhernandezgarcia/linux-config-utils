# How to profile code in Python

This is pretty basic guide about how to profile code in Python. For more information, see[pypi.org/project/line-profiler](https://pypi.org/project/line-profiler/).

1. Install the line profiler package:

```bash
pip install line-profiler
```

2. Add the decorator `@profile` to the function(s) you want to profile

For instance:

```python
@profile
def function_suspected_to_be_slow(a, b):
	...
```

3. Run the script with `kernprof`

```
kernprof -l script_to_profile.py
```

4. Inspect the output of the line profiler

```
python -m line_profiler -rmt "script_to_profile.py.lprof"
```

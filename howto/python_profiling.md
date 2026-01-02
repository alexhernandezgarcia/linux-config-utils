# How to profile code in Python

This is pretty basic guide about how to profile code in Python.

There exist many tools for profiling Python code. Two commonly used tools are:

- [cProfile](https://docs.python.org/3/library/profile.html): native Python profiler which deterministically calculates the total run time of code and each individual step. It is typically used to calculate the time taken by methods.
- [line-profiler](https://pypi.org/project/line-profiler/): a package for line-by-line profiling of specific functions. It is typically used to inspect the details of specific functions.

A convenient workflow can be the following:

1. Identify the most computationally expensive methods with cProfile.
2. Inspect the details of these methods with the line-profiler.

## cProfiler

cProfile is quite a versatile tool, which can be used in different ways. This one way:

Import the necessary packages:

```
import cProfile, pstats
```

Insert the profiling code around the relevant code to be profiled:

```
profiler = cProfile.Profile()
profiler.enable()

# Relevant code, for example the main function of a script.

profiler.disable()
stats = pstats.Stats(profiler).sort_stats('cumtime')
stats.print_stats("regex-expression-1|regex-expression-2")
```

The regex expression in `print_stats()` allows to filter the output, which can be very verbose.

Then, run the script normally.

## Line-profiler

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

## References

- [line-profiler](https://pypi.org/project/line-profiler/)
- [cProfile](https://docs.python.org/3/library/profile.html)
- [machinelearning+: cProfile – How to profile your python code](https://machinelearningplus.com/python/cprofile-how-to-profile-your-python-code/)

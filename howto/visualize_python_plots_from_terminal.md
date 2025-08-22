First, it is important to install `PyQt6`, otherwise the following error may be raised:

```bash
UserWarning: FigureCanvasAgg is non-interactive, and thus cannot be shown
```

To display a Python plot with a system graphics visualiser, do `plt.show()` after creating the plot. For example:

```python
import numpy as np
from matplotlib import pyplot as plt
plt.rcParams["figure.figsize"] = [7.50, 3.50]
plt.rcParams["figure.autolayout"] = True
data = np.random.rand(5, 5)
plt.imshow(data, cmap="copper")
plt.show()
```

To be able to visualise plots in a remote machine, add the following flag in the ssh command: `oForwardX11=yes` or configure ssh with `ForwardX11 yes` to have this behaviour by default.

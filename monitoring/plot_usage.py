import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

data = pd.read_csv("system_usage.csv")

data["CPU"] = pd.to_numeric(data["CPU"], errors="coerce")
data["Memory"] = pd.to_numeric(data["Memory"], errors="coerce")
data.dropna(inplace=True)
x_values = np.arange(len(data))
cpu_usage = np.array(data['CPU'])
memory_usage = np.array(data['Memory'])

plt.figure(figsize=(10, 6))
plt.plot(x_values, cpu_usage, label="CPU Usage", color="b")
plt.plot(x_values, memory_usage, label="Memory Usage", color="g")
plt.xlabel("Time (seconds)")
plt.ylabel("Usage (%)")
plt.title("CPU and Memory Usage Over Time")
plt.legend()
plt.tight_layout()
plt.show()

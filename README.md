# CUDA-on-Qt-Creator
How to run CUDA on Qt Creator
The aim is to configure the Qt Creator project properties to run CUDA code.

The following issues are still unresolved and I still hunting for solutions:

1. The auto-complete feature for threads and block dimensions is not working. Therefore, there is no auto-complete (Ctrl + Space) for threadIdx.[xyz], blockIdx.[xyz].

2. Another challenge is that the CUDA kernel (<<<...>>>) syntax is being highlighted in red marking it as syntax error.

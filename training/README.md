# Environment


Hardware:
- 24 vCPU cores
- 106GB RAM
- 2xL4 GPU with 24GB VRAM each

Software:
- CUDA 12.1
- Driver 530.30.02
- Python=3.9.2
- pip=23.3.2

```bash
pip install -r requirements.txt
pip install flash-attn==2.4.2 --no-build-isolation
```


# Start Training
```bash
bash finetune_llama2_7b_lora.sh
```
L4x2 Batch Size 16 per GPU
```bash
+---------------------------------------------------------------------------------------+
| NVIDIA-SMI 530.30.02              Driver Version: 530.30.02    CUDA Version: 12.1     |
|-----------------------------------------+----------------------+----------------------+
| GPU  Name                  Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf            Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                                         |                      |               MIG M. |
|=========================================+======================+======================|
|   0  NVIDIA L4                       Off| 00000000:00:03.0 Off |                    0 |
| N/A   71C    P0               65W /  75W|  21172MiB / 23034MiB |    100%      Default |
|                                         |                      |                  N/A |
+-----------------------------------------+----------------------+----------------------+
|   1  NVIDIA L4                       Off| 00000000:00:04.0 Off |                    0 |
| N/A   74C    P0               78W /  75W|  21520MiB / 23034MiB |    100%      Default |
|                                         |                      |                  N/A |
+-----------------------------------------+----------------------+----------------------+
                                                                                         
+---------------------------------------------------------------------------------------+
| Processes:                                                                            |
|  GPU   GI   CI        PID   Type   Process name                            GPU Memory |
|        ID   ID                                                             Usage      |
|=======================================================================================|
|    0   N/A  N/A    187110      C   ray::_RayTrainWorker__execute.get_next    21152MiB |
|    1   N/A  N/A    187111      C   ray::_RayTrainWorker__execute.get_next    21500MiB |
+---------------------------------------------------------------------------------------+
```

V100x4 Batch Size 8 per GPU
```bash
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 510.47.03    Driver Version: 510.47.03    CUDA Version: 11.6     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  Tesla V100-SXM2...  Off  | 00000000:00:04.0 Off |                    0 |
| N/A   59C    P0   281W / 300W |  15332MiB / 16384MiB |    100%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
|   1  Tesla V100-SXM2...  Off  | 00000000:00:05.0 Off |                    0 |
| N/A   59C    P0   288W / 300W |  15262MiB / 16384MiB |    100%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
|   2  Tesla V100-SXM2...  Off  | 00000000:00:06.0 Off |                    0 |
| N/A   59C    P0   306W / 300W |  15178MiB / 16384MiB |    100%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
|   3  Tesla V100-SXM2...  Off  | 00000000:00:0B.0 Off |                    0 |
| N/A   59C    P0   322W / 300W |  14556MiB / 16384MiB |    100%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
```
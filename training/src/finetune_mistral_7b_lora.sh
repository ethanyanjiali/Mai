python finetune_hf_llm.py \
    --mx='bf16' \
    --batch_size_per_device=$1 \
    --stop_perplexity=0 \
    --eval_batch_size_per_device=64 \
    --num_devices=$2 \
    --cpu_per_worker=8 \
    --gpu_per_worker=1 \
    --grad_accum=1 \
    --train_path='s3://imaginaire-training-datasets/GSM8K/train.jsonl' \
    --test_path='s3://imaginaire-training-datasets/GSM8K/test.jsonl' \
    --special_token_path='s3://imaginaire-training-datasets/GSM8K/tokens.json' \
    --model_name='mistralai/Mistral-7B-v0.1' \
    --num_epochs=3 \
    --num_checkpoints_to_keep=1 \
    --lr=0.0001 \
    --ctx_len=512 \
    --ds_config='./deepspeed_configs/zero_3_llama_2_7b.json' \
    --anyscale_artifact_storage='s3://imaginaire-training-artifacts/ray' \
    --lora_config='./lora_configs/lora.json' \
    --input_key='input' \
    --conda_env='py39'
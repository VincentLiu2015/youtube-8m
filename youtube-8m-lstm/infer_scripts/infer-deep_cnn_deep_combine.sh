
for part in ensemble_train ensemble_validate test; do 
    CUDA_VISIBLE_DEVICES=0 python inference-pre-ensemble.py \
	      --output_dir="/Youtube-8M/model_predictions/${part}/deep_cnn_deep_combine_chain" \
        --model_checkpoint_path="../model/deep_cnn_deep_combine_chain/model.ckpt-303289" \
	      --input_data_pattern="/Youtube-8M/data/frame/${part}/*.tfrecord" \
	      --frame_features=True \
	      --feature_names="rgb,audio" \
	      --feature_sizes="1024,128" \
	      --batch_size=64 \
	      --file_size=4096
done
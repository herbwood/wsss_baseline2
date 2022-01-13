#!/bin/sh
EXP_NAME=baseline_on_test3

CUDA_VISIBLE_DEVICES=2,3 python scripts/train_cls.py \
    --img_dir=/HDD/dataset/VOC2012/ \
    --train_list=/home/junehyoung/code/wsss_baseline/voc2012_list/train_aug_cls.txt \
    --test_list=/home/junehyoung/code/wsss_baseline/voc2012_list/train_cls.txt \
    --lr=0.001 \
    --epoch=15 \
    --decay_points='5,10' \
    --save_folder=checkpoints/${EXP_NAME} \
    --show_interval=50 \
    --wandb_name=baseline_on_test3
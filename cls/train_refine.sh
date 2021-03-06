#!/bin/sh
EXP_NAME=offset_smooth_b03d05_fgbg_mask_clamp

CUDA_VISIBLE_DEVICES=0,3 python scripts/train_refine.py \
    --img_dir=/HDD/dataset/VOC2012/ \
    --train_list=/home/junehyoung/code/wsss_baseline2/metadata/voc12/train_aug_cls.txt \
    --test_list=/home/junehyoung/code/wsss_baseline2/metadata/voc12/train_cls.txt \
    --lr=0.0001 \
    --epoch=30 \
    --decay_points='10,20' \
    --save_folder=checkpoints/refinement_learning/${EXP_NAME} \
    --show_interval=50 \
    --shuffle_val \
    --wandb_name refinement_learning_${EXP_NAME}

    
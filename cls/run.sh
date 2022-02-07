# Training Classifier with the learnable-DRS
CUDA_VISIBLE_DEVICES=0,1 python scripts/train_cls.py \
    --img_dir=/data/DB/VOC2012/ \
    --lr=0.001 \
    --epoch=15 \
    --decay_points='5,10' \
    --delta=0 \
    --logdir=logs/DRS_learnable \
    --save_folder=checkpoints/DRS_learnable \
    --show_interval=50

# Evaluation pseudo segmentation labels generated by the classifier
# CUDA_VISIBLE_DEVICES=0 python scripts/test_cls.py \
#     --checkpoint=checkpoints/DRS_learnable/best.pth


# Generating localization maps for the refinement learning
CUDA_VISIBLE_DEVICES=0 python scripts/localization_map_gen.py \
    --img_dir=/data/DB/VOC2012/ \
    --checkpoint=checkpoints/DRS_learnable/best.pth


# Refinement learning
CUDA_VISIBLE_DEVICES=0,1 python scripts/train_refine.py \
    --img_dir=/data/DB/VOC2012/ \
    --lr=0.0001 \
    --epoch=30 \
    --decay_points='10,20' \
    --logdir=logs/Refine_DRS_learnable \
    --save_folder=checkpoints/Refine_DRS_learnable \
    --show_interval=50


# Evaluation pseudo segmentation labels generated by the refinement newtork
# CUDA_VISIBLE_DEVICES=0 python scripts/test_refine.py \
#    --checkpoint=checkpoints/Refine_DRS_learnable/best.pth


# Pseudo segmentation label generation
CUDA_VISIBLE_DEVICES=0 python scripts/pseudo_seg_label_gen.py \
    --img_dir=/data/DB/VOC2012/ \
    --checkpoint=checkpoints/Refine_DRS_learnable/best.pth
echo "청소중..."
pip install -U 'jsonargparse[signatures]'
git clone https://github.com/nss2024/DDFA2.git
mv /content/DDFA2 /content/DDFA
rsync -av /content/DDFA/ /content/DeepDFA/
rm -rf /content/DDFA



echo "실행중..."
rm -rf /content/DeepDFA/DDFA/storage/cache
rm -rf /content/DeepDFA/DDFA/storage/processed/bigvul
mkdir /content/DeepDFA/DDFA/storage/processed/bigvul

#스크립트로 돌리기
#cd /content/DeepDFA/DDFA/sastvd/scripts
#bash /content/DeepDFA/DDFA/scripts/preprocess.sh


# 파이썬으로 돌리기
# python /content/DeepDFA/DDFA/sastvd/scripts/prepare.py --dataset bigvul
# python /content/DeepDFA/DDFA/sastvd/scripts/getgraphs.py bigvul --overwrite
# python /content/DeepDFA/DDFA/sastvd/scripts/dbize.py
# python /content/DeepDFA/DDFA/sastvd/scripts/dbize_graphs.py
# python /content/DeepDFA/DDFA/sastvd/scripts/abstract_dataflow_full.py --no-cache --stage 1
# python /content/DeepDFA/DDFA/sastvd/scripts/abstract_dataflow_full.py --no-cache --stage 2
# python /content/DeepDFA/DDFA/sastvd/scripts/dbize_absdf.py


# linevul 폴더 아래의 data에 test val train (용량 10기가 이상) 넣고 linevul + deepdfa 돌리기(msr_train_combined)
#bash scripts/msr_train_combined.sh 1 MSR
#python /content/DeepDFA/DDFA/code_gnn/main_cli.py fit --config /content/DeepDFA/DDFA/configs/config_bigvul.yaml --config /content/DeepDFA/DDFA/configs/config_ggnn.yaml

#train
#python code_gnn/main_cli.py fit --config configs/config_bigvul.yaml --config configs/config_ggnn.yaml $@

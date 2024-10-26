echo "청소중..."
pip install -U 'jsonargparse[signatures]'
git clone https://github.com/nss2024/DDFA2.git
mv /content/DDFA2 /content/DDFA
rsync -av /content/DDFA/ /content/DeepDFA/
rm -rf /content/DDFA



echo "실행중..."
rm -rf /content/DeepDFA/DDFA/storage/cache
rm -rf /content/DeepDFA/DDFA/storage/processed/bigvul

cd /content/DeepDFA/DDFA/sastvd/scripts
python /content/DeepDFA/DDFA/sastvd/scripts/prepare.py --dataset bigvul
python /content/DeepDFA/DDFA/sastvd/scripts/getgraphs.py bigvul --overwrite
python /content/DeepDFA/DDFA/sastvd/scripts/dbize.py
python /content/DeepDFA/DDFA/sastvd/scripts/dbize_graphs.py
python /content/DeepDFA/DDFA/sastvd/scripts/abstract_dataflow_full.py --no-cache --stage 1
python /content/DeepDFA/DDFA/sastvd/scripts/abstract_dataflow_full.py --no-cache --stage 2
python /content/DeepDFA/DDFA/sastvd/scripts/dbize_absdf.py

python /content/DeepDFA/DDFA/code_gnn/main_cli.py fit --config /content/DeepDFA/DDFA/configs/config_bigvul.yaml --config /content/DeepDFA/DDFA/configs/config_ggnn.yaml

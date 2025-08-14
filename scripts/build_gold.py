import os
import pandas as pd

# Caminhos
base_dir = os.path.dirname(__file__)
silver_path = os.path.join(base_dir, "..", "silver", "sinasc", "sinasc_2022_sc_clean.parquet")
gold_path = os.path.join(base_dir, "..", "gold", "sinasc", "fato_nascimentos.parquet")

# Criar pasta gold 
os.makedirs(os.path.dirname(gold_path), exist_ok=True)

print("📂 Lendo dados do Silver...")
df = pd.read_parquet(silver_path)

# Exemplo: criar tabela fato e dimensões simples
# Dimensão: tempo (ano, mês)
df["DTNASC"] = pd.to_datetime(df["DTNASC"], errors="coerce")
dim_tempo = df[["DTNASC"]].drop_duplicates().reset_index(drop=True)
dim_tempo["ano"] = df["DTNASC"].dt.year
dim_tempo["mes"] = df["DTNASC"].dt.month

# Dimensão: município
dim_municipio = df[["CODMUNRES"]].drop_duplicates().reset_index(drop=True)

# Fato: nascimento
fato_nascimentos = df[["CODMUNRES", "DTNASC", "SEXO", "PESO"]].copy()
fato_nascimentos = fato_nascimentos.merge(dim_tempo, on="DTNASC", how="left")

# Salvar tabela fato (gold)
fato_nascimentos.to_parquet(gold_path, index=False)
print(f"✅ Silver → Gold concluído. Arquivo salvo em: {gold_path}")

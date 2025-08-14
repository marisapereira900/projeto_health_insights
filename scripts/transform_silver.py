import os
import pandas as pd

# Caminhos
base_dir = os.path.dirname(__file__)
bronze_path = os.path.join(base_dir, "..", "bronze", "sinasc", "sinasc_2022_sc.csv")
silver_path = os.path.join(base_dir, "..", "silver", "sinasc", "sinasc_2022_sc_clean.parquet")

# Criar pasta silver se não existir
os.makedirs(os.path.dirname(silver_path), exist_ok=True)

print("📂 Lendo CSV do bronze...")
df = pd.read_csv(bronze_path, sep=";", encoding="utf-8", low_memory=False)

# Limpeza básica
df_clean = df.drop_duplicates()          # Remove duplicados
df_clean = df_clean.dropna(subset=["CODMUNRES", "DTNASC", "SEXO"])  # Campos essenciais

# Salvar no silver
df_clean.to_parquet(silver_path, index=False)
print(f"✅ Bronze → Silver concluído. Arquivo salvo em: {silver_path}")

import os
import pandas as pd

# Caminho para o arquivo original
base_dir = os.path.dirname(__file__)
input_path = os.path.join(base_dir, "..", "bronze", "sinasc", "sinasc_2022.csv")

# Caminho para salvar o filtrado
output_path = os.path.join(base_dir, "..", "bronze", "sinasc", "sinasc_2022_sc.csv")

print("📂 Lendo arquivo CSV completo...")
df = pd.read_csv(input_path, sep=";", encoding="utf-8", low_memory=False)

print(f"Total de registros no arquivo original: {len(df)}")

# Ajuste o nome da coluna conforme estiver no seu CSV
# No OpenDataSUS, a coluna costuma ser 'UF_NASC' ou 'CODUF'
col_uf = "CODMUNRES"
if col_uf not in df.columns:
    print("⚠️ Coluna CODMUNRES não encontrada, verificando possíveis nomes...")
    print(df.columns)
    raise SystemExit

# Filtra SC pelo código IBGE do município de residência (42xxxx)
df_sc = df[df["CODMUNRES"].astype(str).str.startswith("42")]

print(f"✅ Registros de SC: {len(df_sc)}")


# Salva o resultado
df_sc.to_csv(output_path, sep=";", index=False, encoding="utf-8")
print(f"📄 Arquivo filtrado salvo em: {output_path}")

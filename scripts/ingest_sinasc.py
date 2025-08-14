import os
import pandas as pd
import requests

output_dir = os.path.join(os.path.dirname(__file__), "..", "bronze", "sinasc")
os.makedirs(output_dir, exist_ok=True)

url = "ftp://ftp.datasus.gov.br/dissemin/publicos/SINASC/2022/DNRES2022_SC.dbf"
filename = os.path.join(output_dir, "DNRES2022_SC.dbf")

print("📥 Baixando arquivo DBF do SINASC SC 2022...")

# Como requests não funciona com FTP, vamos usar urllib
import urllib.request
urllib.request.urlretrieve(url, filename)

print(f"✅ Arquivo salvo em: {filename}")

# Converter DBF para CSV
from dbfread import DBF
table = DBF(filename, load=True, encoding="latin-1")
df = pd.DataFrame(iter(table))
csv_path = filename.replace(".dbf", ".csv")
df.to_csv(csv_path, index=False)
print(f"✅ Arquivo convertido e salvo em: {csv_path}")

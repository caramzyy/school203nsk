#!/bin/bash
# Скачивает фото преподавателей с сайта школы в папку photos/
# Запускать из корня репозитория (там же, где лежит index.html)

set -e
mkdir -p photos
cd photos

UA="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0 Safari/537.36"
REF="https://s203nsk.edusite.ru/sveden/employees"
BASE="https://s203nsk.edusite.ru/sveden"

urls=(
  "photo/eb5e080a-5609-4b22-8d33-2624a0de98ec.jpg"
  "photo/1f89a024-c1c7-4a6a-b220-6586933efd40.jpg"
  "photo/cf9b8813-e63a-4cd7-97ff-639ede4752e2.jpg"
  "photo/c316d7ed-6b73-4071-8cc1-f5c8e53f9cb3.jpg"
  "photo/4ae1cfa4-b1bc-4993-99ef-1f4f162b5c19.jpg"
  "photo/94dd7d97-8bb4-4a74-a313-fc3706ba44d7.jpg"
  "photo/f95b789e-2825-42ee-a2ca-b2026e8fb982.jpg"
  "files/c4a56caeb017101d9d363e9497206891.jpeg"
  "photo/96378558-b855-44ce-ab59-262cfd21342b.jpg"
  "files/8e1c3df9b13eff0c5c28f6ed6f04887c.jpg"
  "photo/53d3637d-3c5f-4357-b6b9-5f16cd7fdb0a.jpg"
  "photo/aead437b-877f-47ad-a58d-b79a7aebbec5.jpg"
  "photo/19bb6789-4e05-4286-9ddd-e2b5ce9c303d.jpg"
  "photo/e09794a2-5cb4-4b5b-b70d-28ecf6dc81ec.jpg"
  "photo/c64067a8-c29f-4590-a547-079fc6a2bd51.jpg"
  "photo/0e89876f-3996-4404-9367-978c1b101b0e.jpg"
  "files/ee71c0e663a89f2b811b27ca47a8e8ec.jpg"
  "photo/85fbeeb9-ca99-4d0b-bcea-d624143280d9.jpg"
  "files/df73ee1ca877ee7f74d8dc48258e339f.jpg"
  "photo/cd30a7a7-0ecd-445a-bab3-f8f376ec644d.jpg"
  "photo/e407fb5e-baeb-4851-b9c4-6f9faddaf624.jpg"
  "photo/2aecf7f2-6952-469a-8dbe-1c717289c7bb.jpg"
  "photo/46e28a2f-7ad6-4d5e-935b-91b6c7e4b6ec.jpg"
  "photo/64e46e73-7dca-4b8c-b0e8-aa5338b02b0b.jpg"
  "photo/de720f3a-b63c-4cf1-a16f-28b87d17eafb.jpg"
  "files/63672a881b505ee9bb3e376a8b20cb79.jpeg"
  "photo/80841f00-bc47-45ba-8fa1-4b92408a89d9.jpg"
  "photo/eb9f9c49-3eac-4f5f-b0f1-cc823249ef71.jpg"
  "photo/092dba08-52e0-478e-9b62-884d01605915.jpg"
  "photo/01c41cb3-905c-4ddb-be22-18f30d7f780e.jpg"
  "files/83c29ff839ee133739145ed2ddff2ab0.jpg"
  "photo/2af938b0-9856-48d3-b9cc-1364825dee1e.jpg"
  "photo/1b1f8a3b-b834-4d87-96d9-eb6eb6c6b1a7.jpg"
  "photo/62d636aa-80f7-420d-9d17-b59b6205d9e4.jpg"
)

for path in "${urls[@]}"; do
  filename=$(basename "$path")
  echo "Скачиваю $filename ..."
  curl -sSL \
    -A "$UA" \
    -e "$REF" \
    -o "$filename" \
    "$BASE/$path"
done

echo ""
echo "Готово. Скачано файлов: $(ls -1 | wc -l)"

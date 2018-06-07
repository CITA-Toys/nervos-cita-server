json.extract! page_info, :id, :name, :locale, :content, :created_at, :updated_at
json.url page_info_url(page_info, format: :json)

json.matching_items @shoe.matching_items do |json, items|
  json.(items, :id, :user_id, :shoe_id, :description)
  json.mix_photo_sm items.mix_photo.url(:small)
  json.mix_photo_md items.mix_photo.url(:medium)
  json.mix_photo_lg items.mix_photo.url(:big)
end
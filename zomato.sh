for i in {0..80..20}
do
  BEG=$i
  END=$(($i+19))
  curl -X GET --header "Accept: application/json" --header "user-key: d9fd16b5f1a2bf1d8e26fab89b6c3388" "https://developers.zomato.com/api/v2.1/search?entity_id=292&entity_type=city&start=$BEG&count=$END" -o file$BEG.json
done

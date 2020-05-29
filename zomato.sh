for i in {200..280..20}
do
	BEG=$i
	END=$(($i+20))
	curl -X GET --header "Accept: application/json" --header "user-key: e78e739b15a8e5d55c6c4bb69f3f40b6" "https://developers.zomato.com/api/v2.1/search?entity_id=292&entity_type=city&start=$BEG&count=$END" -o file$BEG.json
done

// Search itune API in Vlang
// No warranty of any kind. Use as is.

import json
import net.http
import os

struct SearchMusic {
	resultcount      int [json: resultCount]

	results      []Result
}

struct Result { 
	artistname string [json: artistName]
	collectionprice string [json: collectionPrice]
	kind string [json: kind]
	releasedate string [json: releaseDate]
	trackname string [json: trackName]

}

fn main() {
	config := http.FetchConfig{
		user_agent: 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0'
	}

	user_search := os.input('Search itunes : ')	
	url := 'https://itunes.apple.com/search?term= $user_search'

	resp := http.fetch(http.FetchConfig{ ...config, url: url }) or {
		println('failed to fetch data from the server')
		return
	}
	

	search_results := json.decode(SearchMusic, resp.text) or {
		println('failed to decode json')
		return
	}

	println('Result music search:\n\n $search_results .')
	//println('Raw response:\n\n $resp .')
}
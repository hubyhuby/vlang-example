//Visitors are people coming from outaspace
//It s also a toy lib to search an inverted index :D
// Read LICENSE.txt

module visitor

struct IndexEntry {
    mut:
	term string
	freq int
	doc_hash_list [] int
}
struct Document {
    mut:
	doc_name string
	content string
}

struct InvertedIndex {
    mut:
	index map[int]IndexEntry
	doc_db  map[int]Document
}
struct DocumentMatch{
	mut:
	doc_hash int
	score	int  
	fragments  string 
}

struct DocumentMatchCollection{
	mut:
	doc_list [] DocumentMatch
}

//Create the inverted index
pub fn create_index(indexType string,indexPath string,indexMapping string)  ?InvertedIndex{
	if indexType=='in_memory'{
		//in memory for now ;)
		mut  idx := InvertedIndex{}
		return idx
	}
	return error('Can t create index for : $indexType $indexPath $indexMapping') 
}

//index_document : Index a string document in the inverted index
pub fn(mut idx InvertedIndex) index_doc(document_name string,document_content string)  {
	println("- Indexing : "+document_name+ " => $document_name.hash()")
	// Insert doc in database
	idx.doc_db[document_name .hash()]=Document{} // init pointer. 
	idx.doc_db[document_name .hash()].content =document_content
	idx.doc_db[document_name .hash()].doc_name=document_name
	
	//index words in document
	tokens := tokenize (document_content) //.split(' ')

		for word in tokens{
			
			if idx.index[word.hash()].term ==""{
				idx.index[word.hash()]=IndexEntry{} // init pointer.
				idx.index[word.hash()].term=word
				idx.index[word.hash()].freq++

				idx.index[word.hash()].doc_hash_list<<document_name.hash()
			}else {
				idx.index[word.hash()].freq++
					if is_in_array(document_name.hash(),idx.index[word.hash()].doc_hash_list )
					{
					}else{idx.index[word.hash()].doc_hash_list<<document_name.hash()}
			}
			
		}
}

//Tokenize : transform terms into indexable token
fn tokenize(doc string) ([]string) {
	mut tokens := doc.split(' ') //todo split '-'
	mut stemmed_tokens:= []string{}
	for mut token in tokens{
		if token.len >2   //basic stemming = remove words smaller than 2 which usually carries less info
		{
			stemmed_tokens<<token.to_lower()
		}
	}	
	return stemmed_tokens
}


//Search return document hash where word is found
pub fn(mut idx InvertedIndex) search(term string) []Document {
	println ("Search '$term' :")
	mut doc := [] Document{}
	for hash in idx.index[term.to_lower().hash()].doc_hash_list
	{
		println ("  * "+idx.doc_db[hash].doc_name+": "+idx.doc_db[hash].content)
	doc<< { doc_name :"string",content :"string"}

	}
return doc
}


//Search return document hash where words are both found
//A term query is the simplest possible query. It performs an exact match in the index for the provided term.
//Most of the time users should use a Match Query instead.
pub fn(mut idx InvertedIndex) term_query(terms string) []int {
	println ("Search AND '$terms' found :")
	mut hash_list_result :=  map[int] []int {}
	mut i:=0
	for term in terms.split(' ')
	{print ("\n* $term : ")
		for hash in idx.index[term.hash()].doc_hash_list
		{
			hash_list_result [i] << hash
			print (idx.doc_db[hash].doc_name)
			//println ("  * "+idx.doc_db[hash].doc_name+" \n     "+idx.doc_db[hash].content)
		}
		i++
	}
	println ("\n res to interesct $hash_list_result")
	//for tab in  hash_list_result
	return intersection(hash_list_result[0],hash_list_result[1])
}
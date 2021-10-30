//Toy inverted index 
//See LICENSE.txt 
//THIS IS A WORK IN PROGRESS
//Use at your own risks. No warranty of any kind. 
//Your datas are at risk. Might harm your kitten. 
//An effort to build a toy library wich mimics some very basic  bleve search functions
// https://github.com/hubyhuby/bleve-search-example

module main
import os
import visitor


fn main() {
	println("POC inverted index in Vlang.\n ")

	mut  idx := visitor.create_index('in_memory','todo','todo') or { panic(err.msg) }
	//Index some documents
	idx.index_doc("DocTitle thingy","MAJ mickey donald disney word2 word3 word2000")
	idx.index_doc("DocTitle donald","donald disney test word1 word2 word2 word3")
	idx.index_doc("DocTitle about mickey","mickey disney word2 word3")

	//search for command line term passed in args in the index
	for i,arg in os.args { 
		if i !=0{
			println(idx.search(arg))
		}
    }
	println(idx.term_query("disney word2000"))
}
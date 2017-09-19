// Simple Program to convert DNA Sequences to their Pairs -- cerner_2^5_2017
package main

import ( "bytes"; "fmt"; "unicode";"strings" )
// from https://www.reddit.com/r/dailyprogrammer/comments/2zyipu/20150323_challenge_207_easy_bioinformatics_1_dna/
func main() {
	// define the mappings, back and forth
	dna_mapping := map[string]string{"A":"T","T":"A","C":"G","G":"C",}
	// Codon mappings (reallllyyy long line) - https://en.wikipedia.org/wiki/DNA_codon_table
	codon_mappings := map[string]string{"TTT":"PHE", "TTC":"PHE", "TTA":"LEU","TTG":"LEU","CTT":"LEU","CTC":"LEU", "CTA":"LEU","CTG":"LEU","ATT":"LLE","ATC":"LLE","ATA":"LLE","ATG":"MET", "GTT":"VAL","GTC":"VAL","GTA":"VAL","GTG":"VAL","TCT":"SER","TCC":"SER", "TCA":"SER","TCG":"SER","CCT":"PRO","CCC":"PRO","CCA":"PRO","CCG":"PRO", "ACT":"THR","ACC":"THR","ACA":"THR","ACG":"THR","GCT":"ALA","GCC":"ALA", "GCA":"ALA","GCG":"ALA","TAT":"TYR","TAC":"TYR","TAA":"STOP","TAG":"STOP", "CAT":"HIS","CAC":"HIS","CAA":"GLN","CAG":"GLN","AAT":"ASN","AAC":"ASN", "AAA":"LYS","AAG":"LYS","GAT":"ASP","GAC":"ASP","GAA":"GLU","GAG":"GLU", "TGT":"CYS","TGC":"CYS","TGA":"STOP","TGG":"TRP","CGT":"ARG","CGC":"ARG", "CGA":"ARG","CGG":"ARG","AGT":"SER","AGC":"SER","AGA":"ARG","AGG":"ARG", "GGT":"GLY","GGC":"GLY","GGA":"GLY","GGG":"GLY"}

	// Our input string, output Buffer, and condon Buffer
	var input_dna string; var dna_output bytes.Buffer; var condon_strings_output bytes.Buffer

	// Read the strings -- NOTE: String MUST be in double quotes ""
	fmt.Print("Enter DNA Strand: "); fmt.Scanf("%q",&input_dna)
	// Spin through, convert the characters appropriately
	for _, ch := range input_dna {
		if unicode.IsSpace(rune(ch)) { dna_output.WriteString(" ")
		} else {
			dna_output.WriteString(dna_mapping[string(ch)])
		}
	}
	condon_output := strings.Replace(input_dna," ","",-1)
	for i := 0; i < len(condon_output); i += 3 {
		condon_strings_output.WriteString(codon_mappings[condon_output[i:i+3]] + " ")
	}

	// Output the mapped outputs, and Codon mappings
	fmt.Println("Mapped Output: " + dna_output.String());
    fmt.Println("Codon Mapping: " + condon_strings_output.String());
}

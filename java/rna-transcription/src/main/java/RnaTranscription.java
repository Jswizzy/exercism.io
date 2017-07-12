import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class RnaTranscription {

    private StringBuilder rnaStrandBuilder;

    private static final Map<Character, Character> DNA_TO_RNA;
    static {
        Map<Character, Character> dnaToRna = new HashMap<>();
        dnaToRna.put('G','C');
        dnaToRna.put('C','G');
        dnaToRna.put('T','A');
        dnaToRna.put('A','U');
        DNA_TO_RNA = Collections.unmodifiableMap(dnaToRna);
    }

    public RnaTranscription() {
        rnaStrandBuilder = new StringBuilder();
    }

    public String transcribeNucleotides(String dnaStrand) {

        for (char base: dnaStrand.toCharArray()) {
            rnaStrandBuilder.append(DNA_TO_RNA.get(base));
        }

        return rnaStrandBuilder.toString();
    }
}
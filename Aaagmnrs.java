import java.util.*;

public class Aaagmnrs {
    public String[] anagrams(String[] phrases) {
        Set<String> alreadyExists = new HashSet<>();
        List<String> finalOutput = new ArrayList<>();
        for (String indexPhrase : phrases) {
            String simplified = simplify(indexPhrase);
            if (alreadyExists.add(simplified)) {
                finalOutput.add(indexPhrase);
            }
        }
        return finalOutput.toArray(new String[0]);

    }
    private String simplify(String indexPhrase) {
        char[] chars = indexPhrase.replaceAll("\\s+", "").toLowerCase().toCharArray();
        Arrays.sort(chars);
        return new String(chars);
    }
 }




// anagrams
// permutations ignoring spaces and caps
// given String[] phrases, remove each anagram of an earlier phrase, and thenr eturn the non-anagrams in the same order
// in array form


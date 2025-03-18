import java.util.*;

public class SortByFreqs {
    public String[] sort(String[] data) {
        Map<String, Integer> frequencyMap = new HashMap<>();
        for (String string : data) {
            frequencyMap.put(string, frequencyMap.getOrDefault(string, 0) + 1);
        }
        
        List<String> uniqueStrings = new ArrayList<>(frequencyMap.keySet());
        uniqueStrings.sort((firstString, secondstring) -> {
            int freqCompare = frequencyMap.get(secondstring) - frequencyMap.get(firstString);
            if (freqCompare == 0) {
                return firstString.compareTo(secondstring);
            }
            return freqCompare;
        });
        
        return uniqueStrings.toArray(new String[0]);
    }
}

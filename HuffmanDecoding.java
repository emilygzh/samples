public class HuffmanDecoding {
    public String decode(String archive, String[] dictionary) {
        StringBuilder decodedString = new StringBuilder();
        int n = dictionary.length;
        for (int i = 0; i < archive.length(); ) {
            boolean matched = false;
            for (int j = 0; j < n; j++) {
                String bitString = dictionary[j];
                if (archive.startsWith(bitString, i)) {
                    decodedString.append((char) ('A' + j)); 
                    i += bitString.length(); 
                    matched = true;
                    break;
                }
            }
            if (!matched) {
                throw new IllegalStateException("No valid match found in the dictionary.");
            }
        }
        return decodedString.toString();
    }
}

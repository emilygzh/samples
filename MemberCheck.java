import java.util.*;

public class MemberCheck {
    public String[] whosDishonest(String[] club1, String[] club2, String[] club3) {
        Map<String, Integer> memberCount = new HashMap<>();
        String[][] clubs = {club1, club2, club3};
        for (int i = 0; i < clubs.length; i++) {
            Set<String> visitedToday = new HashSet<>(); 

            for (String member : clubs[i]) {
                if (!visitedToday.contains(member)) {
                    visitedToday.add(member); 
                    memberCount.put(member, memberCount.getOrDefault(member, 0) + 1);
                }
            }
        }

        List<String> cheatingMembers = new ArrayList<>();
        for (Map.Entry<String, Integer> entry : memberCount.entrySet()) {
            if (entry.getValue() > 1) {
                cheatingMembers.add(entry.getKey());
            }
        }

        Collections.sort(cheatingMembers);
        return cheatingMembers.toArray(new String[0]);
    }
}
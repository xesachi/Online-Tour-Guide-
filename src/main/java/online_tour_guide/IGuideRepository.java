package online_tour_guide;

import java.util.List;

// Interface defining the contract for guide data operations
public interface IGuideRepository {
    boolean insertGuide(String username, String email, String licenseno, String phoneno, String dob);
    boolean updateGuide(String id, String username, String email, String licenseno, String phoneno, String dob);
    boolean deleteGuide(String id);
    List<GuideModelC> getAllGuides();
    List<GuideModelC> getGuideById(String id);
}
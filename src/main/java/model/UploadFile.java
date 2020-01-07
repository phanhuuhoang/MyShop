
package model;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;


/**
 *
 * @author User
 */
public class UploadFile {
   //Save the uploaded file to this folder
    private String UPLOADED_FOLDER = "G:/WebJava/MyShop/src/main/webapp/resources/uploads/";
   // return new root file
    public String processFile(MultipartFile file){
        try {

            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            Path path = (Path) Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
            Files.write(path, bytes);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return "/MyShop/src/main/webapp/resources/uploads/"+file.getOriginalFilename();

    }
}

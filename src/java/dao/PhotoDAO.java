/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Contact;
import model.Galery;
import model.Image;

/**
 *
 * @author Vinh Cao
 */
public class PhotoDAO {
     private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet results = null;

    public PhotoDAO() {
    }
    
    // get top 3 galery from database
    public List<Galery> getTop3Galery() throws Exception {
        List<Galery> listGalery = new ArrayList<>();
        try {
            String query = "SELECT TOP 3 * FROM galery";
            connection = DBContext.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(query);
            results = preparedStatement.executeQuery();
            while (results.next()) {
                Galery galery = new Galery();
                galery.setID(results.getInt("ID"));
                galery.setTitle(results.getString("title"));
                galery.setDescription(results.getString("description"));
                galery.setName(results.getString("name"));
                listGalery.add(galery);
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return listGalery;
    }
    // get galery by id

    public Galery getGaleryByID(int id) throws Exception {
        try {
            String query = "SELECT TOP 1 * FROM galery WHERE ID = ?";
            connection = DBContext.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            results = preparedStatement.executeQuery();
            while (results.next()) {
                Galery galery = new Galery();
                galery.setID(results.getInt("ID"));
                galery.setTitle(results.getString("title"));
                galery.setDescription(results.getString("description"));
                galery.setName(results.getString("name"));
                return galery;
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    // get contact information from databsse
    public Contact getContact() throws Exception {
        List<Galery> listGalery = new ArrayList<>();
        try {
            String query = "SELECT TOP 1 * FROM contact";
            connection = DBContext.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(query);
            results = preparedStatement.executeQuery();
            while (results.next()) {
                Contact contact = new Contact();
                contact.setTelephone(results.getString("telephone"));
                contact.setEmail(results.getString("email"));
                contact.setFace_url(results.getString("face_url"));
                contact.setTwitter_url(results.getString("twitter_url"));
                contact.setGoogle_url(results.getString("google_url"));
                contact.setAbout(results.getString("about"));
                contact.setAddress(results.getString("address"));
                contact.setCity(results.getString("city"));
                contact.setCountry(results.getString("country"));
                contact.setMap_url(results.getString("map_url"));
                contact.setImage_main(results.getString("image_main"));
                contact.setIcon_face(results.getString("icon_face"));
                contact.setIcon_twitter(results.getString("icon_twitter"));
                contact.setIcon_google(results.getString("icon_google"));
                return contact;
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    // count number of galery
    
    public int count() throws Exception {
        try {
            String query = "SELECT count(*) FROM galery";
            connection = DBContext.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(query);
            results = preparedStatement.executeQuery();
            int cout = 0;
            while (results.next()) {
                cout = results.getInt(1);
            }
            return cout;
        } catch (Exception ex) {
            throw ex;
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    // get list galery with paging

    public List<Galery> getListGaleryWithPaging(int pageIndex, int pageSize) throws Exception {
        List<Galery> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM ( SELECT ROW_NUMBER() OVER (ORDER BY id ASC) AS rn , * FROM  galery )"
                    + "as b WHERE rn BETWEEN ((?*?) - ?)AND (?*?)";
            connection = DBContext.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, pageSize);
            preparedStatement.setInt(2, pageIndex);
            preparedStatement.setInt(3, pageSize - 1);
            preparedStatement.setInt(4, pageSize);
            preparedStatement.setInt(5, pageIndex);
            results = preparedStatement.executeQuery();
            while (results.next()) {
                Galery galery = new Galery();
                galery.setID(results.getInt("ID"));
                galery.setTitle(results.getString("title"));
                galery.setDescription(results.getString("description"));
                galery.setName(results.getString("name"));
                list.add(galery);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
    // count number image of galery

    public int countImage(int id) throws Exception {
        try {
            String query = "SELECT COUNT(*) FROM images WHERE galery_id = ?";
            connection = DBContext.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            results = preparedStatement.executeQuery();
            int cout = 0;
            while (results.next()) {
                cout = results.getInt(1);
            }
            return cout;
        } catch (Exception ex) {
            throw ex;
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    // get top 1 image of one galery
    public String getImageByGaleryID(int id) throws Exception {
        try {
            String query = "SELECT TOP 1 image_url FROM images\n"
                    + "where galery_id = ?";
            connection = DBContext.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            results = preparedStatement.executeQuery();
            while (results.next()) {
                return DBContext.getInstance().getImagePath() + results.getString(1);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    // get list image of one galery with paging

    public List<Image> getListImageWithPaging(int galeryID, int pageIndex, int pageSize) throws Exception {
        List<Image> list = new ArrayList<>();
        int size = countImage(galeryID);
        try {
            String query = "SELECT * FROM ( SELECT ROW_NUMBER() OVER (ORDER BY id ASC) AS rn , * FROM  images WHERE galery_id = ?) "
                    + "as b WHERE rn BETWEEN ((?*?) - ?)AND (?*?)";
            connection = DBContext.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, galeryID);
            preparedStatement.setInt(2, pageSize);
            preparedStatement.setInt(3, pageIndex);
            preparedStatement.setInt(4, pageSize - 1);
            preparedStatement.setInt(5, pageSize);
            preparedStatement.setInt(6, pageIndex);
            results = preparedStatement.executeQuery();
            while (results.next()) {
                Image image = new Image();
                image.setId(results.getInt("ID"));
                image.setGalery_id(results.getInt("galery_id"));
                image.setImage_url(results.getString("image_url"));
                list.add(image);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
    // get image by id

    public Image getImageID(int id, int galeryId) throws Exception {
        try {
            String query = "SELECT * FROM images WHERE id = ? AND galery_id = ?";
            connection = DBContext.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.setInt(2, galeryId);
            results = preparedStatement.executeQuery();
            while (results.next()) {
                Image image = new Image();
                image.setId(results.getInt("ID"));
                image.setGalery_id(results.getInt("galery_id"));
                image.setImage_url(results.getString("image_url"));
                return image;
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    // get number of views in database
    public int getView(){
        int view  = 0;
        try {
            String query = "SELECT * from [Photographer_Lab].[dbo].[viewnumber] WHERE id = 1";
            connection = DBContext.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(query);
            results = preparedStatement.executeQuery();
            while (results.next()) {
                view = results.getInt("totalViews");
            }
            System.out.println(view);
            return view;
        } catch (SQLException ex) {
            Logger.getLogger(PhotoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }  finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
      return 0;
    }
    
    //update number of view 
    //number of view increase by 1 each time update
    public void updateView(){
        try {
            String query = "UPDATE [Photographer_Lab].[dbo].[viewnumber] SET totalViews = totalViews + 1 WHERE id = 1";
            connection = DBContext.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(query);
            int rs = preparedStatement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(PhotoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}

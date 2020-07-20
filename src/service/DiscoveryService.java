package service;

import dao.DAOFactory;
import dao.DiscoveryDAO;
import model.Discovery;
import model.User;

import java.util.Comparator;
import java.util.Date;
import java.sql.Timestamp;
import java.util.List;

public class DiscoveryService {
    public void addDiscovery(String name, String desc, String url, User user){
        Discovery discovery = createDiscoveryObject(name, desc, url, user);
        DAOFactory factory = DAOFactory.getDAOFACTORY();
        DiscoveryDAO discoveryDAO = factory.getDiscoveryDAO();
        discoveryDAO.create(discovery);
    }

    private Discovery createDiscoveryObject(String name, String desc, String url, User user){
        Discovery discovery = new Discovery();
        discovery.setName(name);
        discovery.setDescription(desc);
        discovery.setUrl(url);
        User userCopy = new User(user);
        discovery.setUser(userCopy);
        discovery.setTimestamp(new Timestamp(new Date().getTime()));
        return discovery;

    }

    public Discovery getDiscoveryById(long discoveryId){
        DAOFactory factory = DAOFactory.getDAOFACTORY();
        DiscoveryDAO discoveryDao = factory.getDiscoveryDAO();
        Discovery discovery = discoveryDao.read(discoveryId);
        return discovery;
    }

    public boolean updateDiscovery(Discovery discovery){
        DAOFactory factory = DAOFactory.getDAOFACTORY();
        DiscoveryDAO discoveryDao = factory.getDiscoveryDAO();
        boolean result = discoveryDao.update(discovery);
        return result;
    }

    public List<Discovery>getAllDiscoveries(){
        return getAllDiscoveries(null);
    }

    public List<Discovery> getAllDiscoveries(Comparator<Discovery> comparator){
        DAOFactory factory = DAOFactory.getDAOFACTORY();
        DiscoveryDAO discoveryDao = factory.getDiscoveryDAO();
        List<Discovery> discoveries = discoveryDao.getAll();
        if(comparator!=null && discoveries != null){
            discoveries.sort(comparator);
        }
        return discoveries;
    }
}

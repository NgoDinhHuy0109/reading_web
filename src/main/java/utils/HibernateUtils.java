package utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import models.*;
import java.util.UUID;

public class HibernateUtils {
    private static final SessionFactory sessionFactory;
    protected Object object = null;
    static {
        try {
            // Create the SessionFactory from hibernate.cfg.xml
            sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        } catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public HibernateUtils(Object object) {
        this.object = object;
    }

    public void saveEntity() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        // Save the cat object
        session.save(this.object);

        session.getTransaction().commit();
        session.close();
    }

    public <T> T    getEntityById(Class<T> entityType, UUID pk) {
        Session session = sessionFactory.openSession();
        Transaction transaction = null;
        T entity = null;
        try {
            transaction = session.beginTransaction();
            entity = session.get(entityType, pk);
            session.getTransaction().commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Error retrieving entity by ID: " + e.getMessage());
        } finally {
            session.close();
        }
        return entity;
    }
    public void updateEntity(Object entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(entity);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

}

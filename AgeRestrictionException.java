package ee.taltech.inbankbackend.exceptions;
/**
 * Thrown when age is invalid.
 */
public class AgeRestrictionException extends Exception {
    public AgeRestrictionException(String message) {
        super(message);
    }
}

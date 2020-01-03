public interface IInterruptChecker {
    /**
     * Checks if we should interrupt the pipeline
     * 
     * @param Object payload
     * @return Boolean
     */
    Boolean shouldInterrupt(Object payload);
}

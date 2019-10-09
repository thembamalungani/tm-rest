/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used as a container
 * @date 2019-10-03
 */
public class Application {
    
    public static final Application.ComponentFactory Component = 
        new Application.ComponentFactory(
            new Map<Type, Type> {
                IRestDispatcher.class => RequestDispatcher.class,
                AsyncHttpRequestHandler.class => AsyncHttpRequestHandler.class,
                ILeadBatchParser.class => LeadBatchParser.class,
                IAsyncLeadHandler.class => AsyncLeadHandler.class
            }
        );
    
    public static final Application.LeadHandlerFactory LeadHandler = 
        new Application.LeadHandlerFactory(
            new Map<LeadType, Type> {
                LeadType.DOWNLOADED_INFO_PACK => DownloadedInfoPackHandler.class,
                LeadType.REQUESTED_A_CALL => RequestedACallHandler.class,
                LeadType.SUBMITTED_REGISTRATION_STEP1 => SubmittedRegistrationStep1Handler.class,
                LeadType.CALENDLY_RAC_CREATED => CalendlyHandler.class,
                LeadType.CALENDLY_RAC_CANCELED => CalendlyHandler.class
            }
        );

    public static final Application.LeadMapperFactory LeadMapper = 
        new Application.LeadMapperFactory(
            new Map<LeadType, Type> {
                LeadType.DOWNLOADED_INFO_PACK => DownloadedInfoPackMapper.class,
                LeadType.REQUESTED_A_CALL => RequestedACallMapper.class,
                LeadType.SUBMITTED_REGISTRATION_STEP1 => SubmittedRegistrationStep1Mapper.class,
                LeadType.CALENDLY_RAC_CREATED => CalendlyLeadMapper.class,
                LeadType.CALENDLY_RAC_CANCELED => CalendlyLeadMapper.class
            }
        );

    public static final Application.LeadMapperFactory Selector = 
        new Application.Selector(
            new Map<ISelector, Type> {
                IAccountSelector.class => AccountSelector.class
            }
        );

    public static final Application.ServiceFactory Service = 
        new Application.ServiceFactory(
            new Map<Type, Type> {
                IAccountService.class => AccountService.class,
                IOpportunityService.class => OpportunityService.class,
                ICaseService => CaseService.class,
                IHttpRequestLoggerService.class => SysIntegrationRequestLoggerService.class
            }
        );

    /**
     * @author Themba Malungani <themba.clarence@gmail.com>
     * @description Used as a container for components
     * @date 2019-10-03
     */
    public class ComponentFactory {
        
        /**
         * The mapping between component interface and implementation
         *
         * @param Map<Type, Type> componentImplementationMapping
         */
        private Map<Type, Type> componentImplementationMapping;

        /**
         * Inject the lead compoeny mappings
         *
         * @param Map<Type, Type> componentImplementationMapping
         */
        public ComponentFactory(Map<Type, Type> componentImplementationMapping) {

            this.componentImplementationMapping = componentImplementationMapping;
        }

        /**
         * Create a new instance of component from the interface
         *
         * @param Type componentInterface
         * @return Object
         */
        public Object newInstance(Type componentInterface) {

            Type componentImplementation = componentImplementationMapping.get(componentInterface);

            if (componentImplementation == null) {

                throw new Exception('No mapper for: ' + componentInterface.getName());
            }

            return componentImplementation.newInstance();
        }
    }

    /**
     * @author Themba Malungani <themba.clarence@gmail.com>
     * @description Used as a container for lead mappers
     * @date 2019-10-03
     */
    public class LeadMapperFactory {
        
        /**
         * The mapping between mapper interface and implementation
         *
         * @param Map<Type, Type> mapperImplementationMapping
         */
        private Map<Type, Type> mapperImplementationMapping;

        /**
         * Inject the lead mapper mappings
         *
         * @param Map<Type, Type> mapperImplementationMapping
         */
        public LeadMapperFactory(Map<Type, Type> mapperImplementationMapping) {

            this.mapperImplementationMapping = mapperImplementationMapping;
        }

        /**
         * Create a new instance of mapper from the interface
         *
         * @param Type mapperInterface
         * @return Object
         */
        public Object newInstance(Type mapperInterface) {

            Type mapperImplementation = mapperImplementationMapping.get(mapperInterface);

            if (mapperImplementation == null) {

                throw new Exception('No mapper for: ' + mapperInterface.getName());
            }

            return (ILeadMapper) mapperImplementation.newInstance();
        }
    }

    /**
     * @author Themba Malungani <themba.clarence@gmail.com>
     * @description Used as a container for lead handlers.
     * @date 2019-10-03
     */
    public class LeadHandlerFactory {

        /**
         * The mapping netween handler interface and implementation
         *
         * @param Map<Type, Type> handleMapping
         */
        private Map<Type, Type> handleMapping;

        /**
         * Inject the lead handler mapping
         *
         * @param Map<Type, Type> handleMapping
         */
        public LeadHandlerFactory(Map<LeadType, Type> handleMapping) {

            this.handleMapping = handleMapping;
        }

        /**
         * Create a handler instance by using the implementation mapping
         *
         * @param Type handlerInterface
         * @return Object
         */
        public ILeadHandler newInstance(LeadType leadType) {

            Type handler = handleMapping.get(leadType);

            if (handler == null) {

                throw new Exception('No handler implementation for: ' + leadType.getName());
            }

            return (ILeadHandler) handler.newInstance();
        }
    }

    /**
     * @author Themba Malungani <themba.clarence@gmail.com>
     * @description Used as a container for services
     * @date 2019-10-03
     */
    public class ServiceFactory {

        /**
         * The mapping for service interface to implementation
         *
         * @param Map<Type, Type> serviceImplementationMapping
         */
        private Map<Type, Type> serviceImplementationMapping;

        /**
         * Inject the service mapping
         *
         * @param Map<Type, Type> serviceImplementation
         */
        public ServiceFactory(Map<Type, Type> serviceImplementationMapping) {

            this.serviceImplementationMapping = serviceImplementationMapping;
        }

        /**
         * Create an instance of the service which is mapped for serviceInterface
         *
         * @param Type serviceInterface
         * @return Object
         */
        public Object newInstance(Type serviceInterface) {

            Type serviceImplementation = serviceImplementationMapping.get(serviceInterface);
            
            if (serviceInterface == null) {

                throw new Exception('No implementation for the service: ' + serviceInterface.getName());
            }

            return serviceImplementation.newInstance();
        }
    }
}

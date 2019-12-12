/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to handle leads endpoint
 * @date 2019-10-01
 */
@RestResource(UrlMapping='/leads/*')
global class LeadHandler_IH_v1 {
    /**
     * Used to handle creating leads
     *
     * @return HttpResponsep
     */
   	@HttpPost
    global static String create() {

        HttpResponse response = (new RequestDispatcher()).dispatch(LeadsCreateHandler.class);

        RestContext.response.statusCode = response.statusCode;

        return response.body;
    }
}
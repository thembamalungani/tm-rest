public class HttpResponse {
    
    /**
    * Return a 202 status code with http accepted
    *
    * @return IHttpResponse
    */
   public static HttpResponse accepted() {

       return HttpResponse.builder()
                    .statusCode()
                    .body()
                .build();
   }

   /**
    * Return a 400 status code with http bad request
    *
    * @return IHttpResponse
    */
   public static HttpResponse badRequest() {

       return HttpResponse.builder()
                    .statusCode()
                    .body()
                .build();
   }
}

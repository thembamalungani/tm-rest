public class HttpResponse {
    
    private String body;
    private Integer statusCode;

    public HttpResponse(HttpResponse.Builder builder) {

        this.body = builder.body;
        this.statusCode = builder.statusCode;
    }

    public static HttpResponse builder() {

        return new HttpResponse.Builder();
    }

    public void setStatusCode(Integer statusCode) {

        this.statusCode = statusCode;
    }

    public void setBody(String body) {

        this.body = body;
    }

    public class Builder {

        public String body;
        public Integer statusCode;

        public HttpResponse build() {

            return new HttpResponse(this);
        }

        public Builder statusCode(Integer statusCode) {

            this.statusCode = statusCode;

            return this;
        }

        public Builder body(String body) {

            this.body = body;

            return this;
        }
    }

    /**
    * Return a 202 status code with http accepted
    *
    * @return IHttpResponse
    */
   public static HttpResponse accepted(String body) {

       return HttpResponse.builder()
                    .statusCode(202)
                    .body(body)
                .build();
   }

   /**
    * Return a 400 status code with http bad request
    *
    * @return IHttpResponse
    */
   public static HttpResponse badRequest(String body) {

       return HttpResponse.builder()
                    .statusCode(400)
                    .body(body)
                .build();
   }
}

public class BaseHttpResponse {
    
    public String body;
    public Integer statusCode;

    public BaseHttpResponse(BaseHttpResponse.Builder builder) {
        this.body = builder.body;
        this.statusCode = builder.statusCode;
    }

    public static BaseHttpResponse.Builder builder() {
        return new BaseHttpResponse.Builder();
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

        public BaseHttpResponse build() {
            return new BaseHttpResponse(this);
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
   public static BaseHttpResponse accepted(String body) {
       return BaseHttpResponse.builder()
                .statusCode(202)
                .body(body)
                .build();
   }

   /**
    * Return a 400 status code with http bad request
    *
    * @return IHttpResponse
    */
   public static BaseHttpResponse badRequest(String body) {
       return BaseHttpResponse.builder()
                .statusCode(400)
                .body(body)
                .build();
   }
}
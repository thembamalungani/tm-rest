/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Http response object
 * @date 2019-10-01
 */
public class BaseHttpResponse {
    
    public String body;
    public Integer statusCode;

    /**
     * BaseHttpResponse constructor
     *
     * @param BaseHttpResponse.Builder builder
     */
    public BaseHttpResponse(BaseHttpResponse.Builder builder) {
        this.body = builder.body;
        this.statusCode = builder.statusCode;
    }

    /**
     * Returns an instance of BaseHttpResponse.Builder
     *
     * @return BaseHttpResponse.Builder
     */
    public static BaseHttpResponse.Builder builder() {
        return new BaseHttpResponse.Builder();
    }

    /**
     * Sets the status code of the response
     *
     * @param Integer statusCode
     * @return 
     */
    public void setStatusCode(Integer statusCode) {
        this.statusCode = statusCode;
    }

    /**
     * Sets the body of the response
     *
     * @param String body
     * @return 
     */
    public void setBody(String body) {
        this.body = body;
    }

    /**
     * @author Themba Malungani <themba.clarence@gmail.com>
     * @description Response builder class
     * @date 2019-10-01
     */
    public class Builder {
        public String body;
        public Integer statusCode;

        /**
         * Builds a BaseHttpResponse
         */
        public BaseHttpResponse build() {
            return new BaseHttpResponse(this);
        }

        /**
         * Sets the status code of the response
         *
         * @param Integer statusCode
         * @return 
         */
        public Builder statusCode(Integer statusCode) {
            this.statusCode = statusCode;
            return this;
        }

        /**
         * Sets the body of the response
         *
         * @param String body
         * @return 
         */
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
package shop.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.paypal.api.payments.Payee;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import shop.bean.PaypalPaymentIntent;
import shop.bean.PaypalPaymentMethod;
@Component
public class PayPalService {
    private APIContext apiContext;

    public Payment createPayment(
    		List<Transaction> transactions,
    		Payer payer,
    		Payee payee,
            PaypalPaymentMethod method, 
            PaypalPaymentIntent intent, 
            String cancelUrl, 
            String successUrl) throws PayPalRESTException{
        
    	Payment payment = new Payment();
        payment.setPayer(payer);
        payment.setIntent(intent.toString());
        payment.setState("COMPLETED");
        payment.setTransactions(transactions);
        
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl(cancelUrl);
        redirectUrls.setReturnUrl(successUrl);
        payment.setRedirectUrls(redirectUrls);
        
        return payment.create(apiContext);
    }

    public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException{
        Payment payment = new Payment();
        payment.setId(paymentId);
        PaymentExecution paymentExecute = new PaymentExecution();
        paymentExecute.setPayerId(payerId);
        return payment.execute(apiContext, paymentExecute);
    }
}

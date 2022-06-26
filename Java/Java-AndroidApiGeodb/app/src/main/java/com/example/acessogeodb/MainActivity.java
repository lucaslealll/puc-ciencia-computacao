package com.example.acessogeodb;

import androidx.appcompat.app.AppCompatActivity;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.Gson;

import java.io.IOException;
import java.util.ArrayList;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "MainActivity";
    private Button mBotaoBusca;
    private TextView mTextViewDados;
    private String mInputCidade;
    Response response;

    private class TarefaBuscaDadosCidades extends AsyncTask<Void, Void, ArrayList<DadosCidade>> {
        @Override
        protected ArrayList<DadosCidade> doInBackground(Void... params) {

            OkHttpClient client = new OkHttpClient();
            Request request = new Request.Builder()
                .url("https://wft-geo-db.p.rapidapi.com/v1/geo/cities?namePrefix=" + mInputCidade + "&languageCode=pt")
                .get()
                .addHeader("X-RapidAPI-Host", "wft-geo-db.p.rapidapi.com")
                .addHeader("X-RapidAPI-Key", "c319c67ee9msh4235207ac907810p106a51jsnfeb0f0c03d49")
                .build();

            ArrayList<DadosCidade> lista = new ArrayList<>();

            try {
                response = client.newCall(request).execute();
                String responseBody = response.body().string();

                // parse do item recebido
                Gson gson = new Gson();
                RootData rootData = gson.fromJson(responseBody, RootData.class);
                lista.addAll(rootData.getData());

                Log.i(TAG, "doInBackground: " + lista);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return lista;
        }

        @Override
        public void onPostExecute(ArrayList<DadosCidade> resultado) {
            Log.i(TAG, "onPostExecute: metodo executado");
            StringBuilder texto = new StringBuilder();

            if(resultado.isEmpty()){
                texto.append("NENHUMA CIDADE ENCONTRADA! ☹");
            }else {
                for (int i = 0; i < resultado.size(); i++) {
                    Log.i(TAG, "onPostExecute: dados recebidos: " + resultado.get(i).getCity());
                    String cidade = "\n" + (i + 1) +
                            "º CIDADE ENCONTRADA:\n🏙  " + resultado.get(i).getCity() + "\n" +
                            "🌆  Estado: " + resultado.get(i).getRegion() + "\n" +
                            "🗺  País: " + resultado.get(i).getCountry() + "/" + resultado.get(i).getCountryCode() + "\n" +
                            "👥  Habitantes: " + resultado.get(i).getPopulation() + "\n" +
                            "🌐  Latitude: " + resultado.get(i).getLatitude() + "\n" +
                            "🌐  Longitude: " + resultado.get(i).getLongitude() + "\n";
                    texto.append(cidade);
                }
            }
            mTextViewDados = findViewById(R.id.input_city_name);
            mTextViewDados.setText(texto.toString());
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mBotaoBusca = (Button) findViewById(R.id.botaoBusca);
        mTextViewDados = findViewById(R.id.input_city_name);
        mBotaoBusca.setOnClickListener(view -> {
            mTextViewDados.setText("");
            getinput();
        });
    }

    void getinput() {
        EditText et = findViewById(R.id.ipt_city);
        mInputCidade = et.getText().toString();

        if (!mInputCidade.isEmpty()) {
            AsyncTask<Void, Void, ArrayList<DadosCidade>> tar = new TarefaBuscaDadosCidades();
            tar.execute();
        } else {
            Toast.makeText(this, "Nenhuma cidade solicitada", Toast.LENGTH_SHORT).show();
        }
    }

    public void sair(View view) {
        finishAffinity();
    }
}
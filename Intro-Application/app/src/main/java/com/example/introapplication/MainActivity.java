package com.example.introapplication;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.NumberPicker;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }
    int count =0;
    public void buttonCLick(View buttonView){
        count++;
        Log.i("Button Click = ", count+"");
//        TextView text = (TextView)findViewById((R.id.countText));
//        text.setText(count);
        EditText number = (EditText)findViewById(R.id.editText);
        Log.i("Number -",number.getText().toString());
    }
}

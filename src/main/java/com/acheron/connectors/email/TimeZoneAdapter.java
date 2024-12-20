package com.acheron.connectors.email;

import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;

import java.io.IOException;
import java.util.TimeZone;
/**
 * Custom `TypeAdapter` for serializing and deserializing `TimeZone` objects.
 * 
 * @author HariharanB
 */
public class TimeZoneAdapter extends TypeAdapter<TimeZone> {

    @Override
    public void write(JsonWriter out, TimeZone value) throws IOException {
        out.value(value.getID());
    }

    @Override
    public TimeZone read(JsonReader in) throws IOException {
        return TimeZone.getTimeZone(in.nextString());
    }
}
